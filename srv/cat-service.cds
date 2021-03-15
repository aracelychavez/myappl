using my.bookshop as my from '../db/data-model';

service CatalogService {

  @readonly entity Books as SELECT from my.Books { *,
    author.name as author
  } excluding { createdBy, modifiedBy };

  entity Orders @( odata.draft.enabled : true  )
  as projection on my.Orders;

}