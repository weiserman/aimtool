using EmailService as service from '../srv/email-service';

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
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : emailSubject
        }
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Vendor Name', Value : vendorName },
            { $Type : 'UI.DataField', Label : 'Email Subject', Value : emailSubject },
            { $Type : 'UI.DataField', Label : 'Email Sender', Value : emailSender },
            { $Type : 'UI.DataField', Label : 'Email Received', Value : emailReceived },
        ]
    },
    UI.FieldGroup #Invoice : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Invoice Number', Value : invoiceNumber },
            { $Type : 'UI.DataField', Label : 'Invoice Date', Value : invoiceDate },
            { $Type : 'UI.DataField', Label : 'Invoice Amount', Value : invoiceAmount },
            { $Type : 'UI.DataField', Label : 'Currency', Value : currency.code },
            { $Type : 'UI.DataField', Label : 'Status', Value : status },
        ]
    },
    UI.FieldGroup #OCR : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'OCR Confidence Score', Value : ocrConfidenceScore },
            { $Type : 'UI.DataField', Label : 'Error Message', Value : errorMessage },
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            ID : 'InvoiceDetails',
            Label : 'Invoice Information',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'General Information', Target : '@UI.FieldGroup#General' },
                { $Type : 'UI.ReferenceFacet', Label : 'Invoice Details', Target : '@UI.FieldGroup#Invoice' },
                { $Type : 'UI.ReferenceFacet', Label : 'OCR Information', Target : '@UI.FieldGroup#OCR' }
            ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID : 'Attachments',
            Label : 'Attachments',
            Facets : [
                { $Type : 'UI.ReferenceFacet', Label : 'Documents', Target : 'documents/@UI.LineItem' }
            ]
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : emailSubject,
            ![@HTML5.CssDefaults] : {width : '25rem'}
        },
        {
            $Type : 'UI.DataField',
            Value : vendorName,
        },
        {
            $Type : 'UI.DataField',
            Value : invoiceNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : invoiceAmount,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality : status,
        }
    ],
    UI.SelectionFields : [
        status,
        vendorName,
        invoiceNumber
    ]
);

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