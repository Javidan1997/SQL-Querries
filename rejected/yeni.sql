PartialPaymentde
ServiceValue ile revokedValueni muqaise edirik beraber oldugu halda baxiriq create timeye eger create time evvelki aylaradirsa bu halda odenisler successCurrentmonha gede biler bunun ucun baxiriq create oldugu ayda rejected kimi verilibmi ?verilibse successde vere bilirik eks halda siyahidan cixardiriq.
ServiceValue ile revokedValueni muqaise edirik beraber olmadigi halda baxiriq create timesi evvelki aylardirsa bu halda odenisleri atiriq RevokedCurrentMontha eks halda RevokedPaymentsa.
RevokedCurrentMontha odenislerinde EMDK-lari Tahir  veririk.


revoked payments de  emdk dan basqa pc kassir odenislerini silirik


select  * into SeccessCurrentMonth from PartialPayments2019August where ServiceValue=RevokeValue and CreateTime< '' and PaymentID in (rejected)


select  * into RevokedCurrentMonth from PartialPayments2019August where ServiceValue!=RevokeValue and CreateTime< '' 


select  * into RevokedPayments from PartialPayments2019August where ServiceValue!=RevokeValue and CreateTime> '' 
