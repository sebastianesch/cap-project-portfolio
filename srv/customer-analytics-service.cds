using {projectportfolio.db as db} from '../db/schema';

service CustomerAnalyticsService {

    @readonly
    @(
        Aggregation       : {ApplySupported: {
            $Type                 : 'Aggregation.ApplySupportedType',
            Transformations       : [
                'aggregate',
                'groupby',
                'concat',
                'identity',
                'filter',
                'search',
                'bottomcount',
                'topcount',
                'orderby',
                'top',
                'skip'
            ],
            GroupableProperties   : [
                'name',
                'industry',
                'country'
            ],
            AggregatableProperties: [
                {Property: ID},
                {Property: count},
                {Property: numberOfProjects}
            ]
        }},
        Common.SemanticKey: [ID]
    )
    entity Customers as
        select from db.Customers as c
        left outer join (
            select
            customer.ID as customer_ID,
            count(
                distinct ID
            )           as numberOfProjects
            from db.Projects group by customer.ID
        ) as p
            on c.ID = p.customer_ID
        {
            key c.ID,
            c.name,
            c.industry,
            c.country,
            c.projects,
            1           as count            : Integer,
            (
                case
                    when
                        p.numberOfProjects is null
                    then
                        0
                    else
                        p.numberOfProjects
                end
            )           as numberOfProjects : Integer
        }

    @readonly
    entity Projects as projection on db.Projects {
        *,
        customer : redirected to Customers
    };

}
