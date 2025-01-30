using EmailService as service from '../srv/email-service';

// Annotations for InboundEmail entity
annotate service.InboundEmail with @(
    UI.HeaderInfo : {
        TypeName : 'Invoice Email',
        TypeNamePlural : 'Invoice Emails',
        Title : {
            $Type : 'UI.DataField',
            Value : emailSubject
        },
        Description : {
            $Type : 'UI.DataField',
            Value : vendorName
        }
    },

    // Define field groups
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Vendor Name', Value : vendorName },
            { $Type : 'UI.DataField', Label : 'Email Subject', Value : emailSubject },
            { $Type : 'UI.DataField', Label : 'Email Sender', Value : emailSender },
            { $Type : 'UI.DataField', Label : 'Email Received', Value : emailReceived },
            { $Type : 'UI.DataField', Label : 'Invoice Number', Value : invoiceNumber },
            { $Type : 'UI.DataField', Label : 'Invoice Amount', Value : invoiceAmount },
            { $Type : 'UI.DataField', Label : 'Status', Value : status }
        ]
    },

    // Define facets for object page layout
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneralInformation',
            Label : 'General Information',
            Target : '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProcessingHistory',
            Label : 'Processing History',
            Target : 'processingLogs/@UI.LineItem'
        }
    ],

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : emailSubject },
        { $Type : 'UI.DataField', Value : vendorName },
        { $Type : 'UI.DataField', Value : invoiceNumber },
        { $Type : 'UI.DataField', Value : invoiceAmount },
        { $Type : 'UI.DataField', Value : status }
    ],

    UI.SelectionFields : [
        status,
        vendorName,
        invoiceNumber
    ]
);

// Annotations for ProcessingLog entity
annotate service.ProcessingLog with @(
    UI.LineItem : [
        { 
            $Type : 'UI.DataField', 
            Value : createdAt,
            Label : 'Timestamp'
        },
        { 
            $Type : 'UI.DataField', 
            Value : activity,
            Label : 'Activity'
        },
        { 
            $Type : 'UI.DataField', 
            Value : description,
            Label : 'Description'
        },
        { 
            $Type : 'UI.DataField', 
            Value : performedBy,
            Label : 'Performed By'
        },
        { 
            $Type : 'UI.DataField', 
            Value : systemActivity,
            Label : 'System Activity'
        },
        { 
            $Type : 'UI.DataField', 
            Value : successful,
            Label : 'Success'
        }
    ],
    
    // Add HeaderInfo for ProcessingLog
    UI.HeaderInfo : {
        TypeName : 'Processing Log',
        TypeNamePlural : 'Processing Logs',
        Title : {
            $Type : 'UI.DataField',
            Value : activity
        },
        Description : {
            $Type : 'UI.DataField',
            Value : description
        }
    }
);

// Add value help for status
annotate service.InboundEmail with {
    status @Common.Label : 'Status' @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'InboundEmail',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterOut',
                LocalDataProperty : status,
                ValueListProperty : 'status',
            }
        ]
    };
}; 