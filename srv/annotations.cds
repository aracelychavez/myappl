using CatalogService as Service from './cat-service';

annotate Service.Books with @(
UI : {
    SelectionFields : [
        title
    ],
    LineItem        : [
        {Value : ID},
        {Value : title},
        {Value : author},
        {Value : stock},
        {Value : price}
    ],
}) {
    ID  @(
        title       : '{i18n>ID}',
        description : '{i18n>ID}'
        );

    title  @(
        title       : '{i18n>title}',
        description : '{i18n>title}'
        );

    author @(
        title       : '{i18n>author}',
        description : '{i18n>author}'
        );

    stock  @(
        title       : '{i18n>stock}',
        description : '{i18n>stock}'
        );

    price  @(
        title       : '{i18n>price}',
        description : '{i18n>price}'
        );
};

annotate Service.Books with @(

    // Page Header
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Header',
            TypeNamePlural : 'Headers',
            Title          : {Value : title},
        },
        HeaderFacets                   : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }
        ],
        FieldGroup #Description        : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
        }
        ]},
        FieldGroup #Details            : {Data : [
         {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : author,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code
        },
        
        ]},
    },
      // Page Facets
    UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        Label  : 'Detalle',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Detalle',
            Target : '@UI.FieldGroup#Details'
        }],
    }
    ]
);


using {
    cuid
} from '@sap/cds/common';

annotate cuid with {
    ID @(
        UI.HiddenFilter,
        Core.Computed
    );
}

annotate Service.Orders with @(
UI : {
    SelectionFields : [
        ID, OrderNo
    ],
    LineItem        : [
        //{Value : ID},
        {Value : OrderNo},
        {Value : book_ID},
        {Value : country_code},
        {Value : currency_code},
        {Value : quantity},
        {Value : amount},
        {Value : tax},
        {Value : total},
    ],
}) {
    ID  @(
        title       : '{i18n>ID}',
        description : '{i18n>ID}'
        );

    OrderNo  @(
        title       : '{i18n>orderNo}',
        description : '{i18n>orderNo}'
        );

    book @(
        title       : '{i18n>book}',
        description : '{i18n>book}'
        );

    country @(
        title       : '{i18n>country}',
        description : '{i18n>country}'
        );


    currency @(
        title       : '{i18n>currency}',
        description : '{i18n>currency}'
        );

    quantity  @(
        title       : '{i18n>quantity}',
        description : '{i18n>quantity}'
        );

    amount  @(
        title       : '{i18n>amount}',
        description : '{i18n>amount}',
        Common.FieldControl : #ReadOnly
        );

    tax  @(
        title       : '{i18n>tax}',
        description : '{i18n>tax}',
        Common.FieldControl : #ReadOnly
        );

    total  @(
        title       : '{i18n>total}',
        description : '{i18n>total}',
        Common.FieldControl : #ReadOnly
        );
};

annotate Service.Orders with @(

    // Page Header
    UI        : {
        HeaderInfo                     : {
            TypeName       : 'Header',
            TypeNamePlural : 'Headers',
            Title          : {Value : ID},
        },
        HeaderFacets                   : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        },
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#AdministrativeData',
            ![@UI.Importance] : #Medium
        }
        ],
        FieldGroup #Description        : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        }
        ]},
        FieldGroup #Details            : {Data : [
         {
            $Type : 'UI.DataField',
            Value : OrderNo,
        },
        {
            $Type : 'UI.DataField',
            Value : book_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
        },
            {
            $Type : 'UI.DataField',
            Value : country_code,
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
        {
            $Type : 'UI.DataField',
            Value : amount
        },
        {
            $Type : 'UI.DataField',
            Value : tax,
        },
        {
            $Type : 'UI.DataField',
            Value : total,
        },
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {
            $Type : 'UI.DataField',
            Value : createdBy
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt
        }
        ],
        }
    },
      // Page Facets
    UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'ORDetails',
        Label  : 'Detalle',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Detalle',
            Target : '@UI.FieldGroup#Details'
        }],
    }
    ]
);