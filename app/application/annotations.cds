using EmailService as service from '../../srv/email-service';
annotate service.InboundEmail with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'emailSubject',
                Value : emailSubject,
            },
            {
                $Type : 'UI.DataField',
                Label : 'emailSender',
                Value : emailSender,
            },
            {
                $Type : 'UI.DataField',
                Label : 'emailReceived',
                Value : emailReceived,
            },
            {
                $Type : 'UI.DataField',
                Label : 'vendorName',
                Value : vendorName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'invoiceNumber',
                Value : invoiceNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'invoiceDate',
                Value : invoiceDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'invoiceAmount',
                Value : invoiceAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ocrConfidenceScore',
                Value : ocrConfidenceScore,
            },
            {
                $Type : 'UI.DataField',
                Label : 'errorMessage',
                Value : errorMessage,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalAttachmentCount',
                Value : totalAttachmentCount,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'emailSubject',
            Value : emailSubject,
        },
        {
            $Type : 'UI.DataField',
            Label : 'emailSender',
            Value : emailSender,
        },
        {
            $Type : 'UI.DataField',
            Label : 'emailReceived',
            Value : emailReceived,
        },
        {
            $Type : 'UI.DataField',
            Label : 'vendorName',
            Value : vendorName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'invoiceNumber',
            Value : invoiceNumber,
        },
    ],
);

