using CustomerAnalyticsService as service from '../../srv/customer-analytics-service';

annotate service.Customers with @(
    UI.SelectionFields                             : [
        industry,
        country
    ],
    UI.PresentationVariant                         : {
        GroupBy       : [
            industry,
            country
        ],
        Total         : [
            count,
            numberOfProjects
        ],
        Visualizations: [
            '@UI.Chart',
            '@UI.LineItem'
        ]
    },
    UI.LineItem                                    : [
        {Value: name},
        {Value: industry},
        {Value: country},
        {Value: count},
        {Value: numberOfProjects}
    ],
    Analytics.AggregatedProperty #numberOfCustomers: {
        Name                : 'NumberOfCustomers',
        AggregationMethod   : 'sum',
        AggregatableProperty: count,
        ![@Common.Label]    : 'Number of Customers'

    },
    Analytics.AggregatedProperty #numberOfProjects : {
        Name                : 'NumberOfProjects',
        AggregationMethod   : 'sum',
        AggregatableProperty: numberOfProjects,
        ![@Common.Label]    : 'Number of Projects'
    },
    UI.Chart                                       : {
        Title              : 'Customers',
        ChartType          : #Column,
        DynamicMeasures    : [
            '@Analytics.AggregatedProperty#numberOfCustomers',
            '@Analytics.AggregatedProperty#numberOfProjects'
        ],
        Dimensions         : [
            'industry',
            'country'
        ],
        MeasureAttributes  : [{
            DynamicMeasure: '@Analytics.AggregatedProperty#numberOfCustomers',
            Role          : #Axis1,
        }],
        DimensionAttributes: [{
            Dimension: industry,
            Role     : #Category
        }]
    }
);
