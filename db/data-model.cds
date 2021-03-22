namespace my.bookshop;
using { Country, Currency, managed, cuid } from '@sap/cds/common';

entity Books {
  key ID : Integer;
  title  : localized String(111);
  author : Association to Authors;
  descr  : localized String(1111);
  stock  : Integer;
  price  : Decimal(9,2);
  currency : Currency;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders : cuid, managed {
  OrderNo   : String;
  book      : Association to Books;
  country   : Country;
  currency  : Currency;  
  quantity  : Integer;
  amount    : Decimal(9,2); 
  tax       : Integer; 
  total     : Decimal(9,2) 
}