using my.bookshop as my from '../db/data-model';
@requires: 'authenticated-user'
service CatalogService {

  @requires: 'viewer'
  @readonly entity Books as SELECT from my.Books { *,
    author.name as author
  } excluding { createdBy, modifiedBy };

  @odata.draft.enabled : true 
  entity Orders 
  @(restrict: [{ grant: '*', to: 'admin'}])
  as projection on my.Orders;

}