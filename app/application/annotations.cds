using EmailService as service from '../../srv/email-service';

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