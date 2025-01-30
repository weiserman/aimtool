namespace pnp;

using { managed, Currency, cuid } from '@sap/cds/common';
using { Attachments } from '@cap-js/attachments';


type WorkflowStatus : String enum {
    ERROR = 'ERROR';                // General error state
    OCR_FAILED = 'OCR_FAILED';      // OCR processing failed
    REJECTED = 'REJECTED';          // Invoice rejected during validation
    NEW = 'NEW';                    // Initial state when email is received
    PENDING_OCR = 'PENDING_OCR';    // Waiting for OCR processin
    VALIDATION = 'VALIDATION';      // Manual validation of OCR result
    OCR_COMPLETE = 'OCR_COMPLETE';  // OCR processing completed successful
    APPROVED = 'APPROVED';          // Invoice approved and ready for processing
    COMPLETED = 'COMPLETED';        // Workflow completed
}

// Processing Activity Types
type ProcessingActivity : String enum {
    EMAIL_RECEIVED;
    SENT_TO_OCR;
    OCR_COMPLETED;
    OCR_FAILED;
    VALIDATION_STARTED;
    VALIDATION_COMPLETED;
    REJECTION_EMAIL_SENT;
    APPROVAL_EMAIL_SENT;
    ERROR_OCCURRED;
    SYSTEM_PROCESSED;
}

entity InboundEmail : managed, cuid {
    emailSubject : String(255);
    emailSender : String(255) @mandatory;
    emailReceived : DateTime;
    vendorName : String(100);
    invoiceNumber : String(50);
    invoiceDate : Date;
    invoiceAmount : Decimal(15,2);
    currency : Currency;
    status : WorkflowStatus default 'NEW';
    ocrConfidenceScore : Decimal(5,2);
    errorMessage : String(1000);
    totalAttachmentCount : Integer;
    invoiceAttachment : Composition of one Attachments;
    documents : Composition of many Attachments;
    processingLogs : Composition of many ProcessingLog on processingLogs.email = $self;
}


entity Invoices : managed {
    key invoiceID : String(50);
    companyCode : String(10);
    dueDate : Timestamp;
    purchaseOrder : String(50);
    doxPositionsJobID   : UUID;
    doxLineItemsJobID   : UUID;
    s3BucketKey         : String;
    statuses            : Composition of many FlowStatuses
                                  on statuses.invoice = $self;
    comments            : Composition of many Comments
                                  on comments.invoice = $self;
}

entity Comments : cuid, managed {
    text    : String;
    author  : String;
    invoice : Association to Invoices;
}

entity FlowStatuses : cuid, managed {
    invoice    : Association to Invoices;
    processor  : Association to Projects_Users;
    descriptor : WorkflowStatus;
}


entity Projects_Users : managed {
    key project : Association to Projects;
    key user    : Association to Users;
        role    : Roles;
        craft   : String;
}

type Roles          : String @assert.range enum {
    ACCOUNTING_MEMBER        = 'ACCOUNTING_MEMBER';
    VALIDATOR                = 'VALIDATOR';
}

entity Projects : cuid, managed {
    name     : String;
    users    : Composition of many Projects_Users
                   on users.project = $self;
}

entity Users : managed {
    key ID       : String; // user email
        name     : String;
        company  : String;
        projects : Composition of many Projects_Users
                       on projects.user = $self;
}

entity ProcessingLog : cuid, managed {
    email           : Association to InboundEmail;
    activity        : ProcessingActivity;
    description     : String(1000);
    performedBy     : String(256);
    systemActivity  : Boolean default false;
    successful      : Boolean default true;
    errorDetails    : String(1000);
}