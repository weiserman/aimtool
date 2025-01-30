using { pnp as db } from '../db/schema';
using { cuid } from '@sap/cds/common';

service EmailService {
    @odata.draft.enabled: true
    entity InboundEmail as projection on db.InboundEmail {
        *,
        processingLogs
    };

    entity ProcessingLog as projection on db.ProcessingLog {
        *,
        email
    };
}