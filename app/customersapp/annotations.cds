using CustomersService as service from '../../srv/customers-service';

annotate service.Customers with @(
    UI.HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>customer}',
            TypeNamePlural : '{i18n>customers}',
            Title: { Value : name },
            Description: { Value : industry }
    }
);

annotate service.Customers with @(
    UI.PresentationVariant : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                Property : name
            }
        ],
        Visualizations: [ '@UI.LineItem' ]
    }
);

annotate service.Customers with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : industry,
        },
        {
            $Type : 'UI.DataField',
            Value : country,
        },
    ]
);

annotate service.Customers with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : industry,
            },
            {
                $Type : 'UI.DataField',
                Value : country,
            },
        ],
    }
);

annotate service.Customers with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'projects/@UI.PresentationVariant',
            Label : 'Projects',
            ID : 'projects',
        },
    ]
);

annotate service.Customers with {
    ID @UI.Hidden : true @UI.HiddenFilter;
};

annotate service.Projects with @(
    UI.HeaderInfo : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>project}',
            TypeNamePlural : '{i18n>projects}',
            Title: { Value : name },
            Description: { Value : type_code }
    }
);

annotate service.Projects with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : type_code,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : startDate,
        },
        {
            $Type : 'UI.DataField',
            Value : endDate,
        },
    ]
);

annotate service.Projects with @( 
    UI.PresentationVariant : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            { Property : name }
        ],
        Visualizations : [ '@UI.LineItem' ]
    }        
);

annotate service.Projects with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : type_code,
            },
        ],
    },
    UI.FieldGroup #GeneratedGroup2 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
            }
        ],
    }
);

annotate service.Projects with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>generalInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : '{i18n>projectDates}',
            Target : '@UI.FieldGroup#GeneratedGroup2',
        },
    ]
);

annotate service.Projects with {
     type @(
        Common : {
            Text: type.name,
            TextArrangement : #TextOnly
        }
    );
};
