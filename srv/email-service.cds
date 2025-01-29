using { pnp as db } from '../db/schema';

service EmailService {
    @odata.draft.enabled: true
    entity InboundEmail as projection on db.InboundEmail {
        *,
        documents
    }
}