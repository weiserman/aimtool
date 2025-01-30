using { pnp as db } from '../db/schema';
using { cuid, managed } from '@sap/cds/common';

service EmailService {
    @odata.draft.enabled: true
    entity InboundEmail as projection on db.InboundEmail {
        *
    };

    // Audit log entity to track changes
    @readonly
    entity InboundEmailAuditLog as projection on db.InboundEmailAuditLog {
        *
    };
}