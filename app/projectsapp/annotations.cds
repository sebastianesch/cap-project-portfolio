using ProjectsService as service from '../../srv/projects-service';

annotate service.Projects with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>project}',
        TypeNamePlural : '{i18n>projects}',
        Title : { Value : name },
        Description : { Value : type_code }
    }
);

annotate service.Projects with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            ![@UI.Importance]: #High
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
    UI.SelectionFields : [ startDate, endDate, customer_ID, type_code ]
);


annotate service.Projects with @(
    UI.PresentationVariant : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            { Property : name }
        ],
        Visualizations: ['@UI.LineItem']
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
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
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
                Value : description,
            },
        ],
    },
    UI.FieldGroup #GeneratedGroup3 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customer.industry,
            },
            {
                $Type : 'UI.DataField',
                Value : customer.country,
            }
        ],
    },
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
            Label : '{i18n>description}',
            Target : '@UI.FieldGroup#GeneratedGroup2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet3',
            Label : '{i18n>customer}',
            Target : '@UI.FieldGroup#GeneratedGroup3',
        },
    ]
);

annotate service.Projects with {
    ID @UI.Hidden : true @UI.HiddenFilter;
    type @(
        Common : {
            Text: type.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues : true,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'ProjectTypes',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : type_code,
                        ValueListProperty : 'code'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'name'
                    }
                ]
            }
        }
    );
    customer @(
        Common : {
            Text: customer.name,
            TextArrangement : #TextOnly,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Customers',
                SearchSupported : true,
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : customer_ID,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'name'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'industry'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'country'
                    }
                ]
            }
        }
    )
};

annotate service.Customers with {
    ID @UI.Hidden @UI.HiddenFilter @Common.Text: name @Common.TextArrangement: #TextOnly;
};

annotate service.ProjectTypes with {
    code @UI.Hidden @UI.HiddenFilter @Common.Text: name @Common.TextArrangement: #TextOnly;
};