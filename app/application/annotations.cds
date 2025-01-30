using EmailService as service from '../../srv/email-service';

// Existing InboundEmail annotations...

annotate service.ProcessingLog with @(
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
    },
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
    ]
);

// Add ProcessingLog to InboundEmail object page
annotate service.InboundEmail with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            ID : 'InvoiceDetails',
            Label : 'Invoice Information',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'General Information', Target : '@UI.FieldGroup#General' }
            ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID : 'ProcessingHistory',
            Label : 'Processing History',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'Processing Logs', Target : 'processingLogs/@UI.LineItem' }
            ]
        }
    ]
); 