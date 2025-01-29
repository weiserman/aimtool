namespace za.co.pnp;

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
}