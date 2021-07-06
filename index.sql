
CREATE INDEX ixReceiveDate ON gate.dbo.Pay (RDate);

CREATE INDEX ixServiceId ON gate.dbo.Payment (SID);

CREATE INDEX ixStatus ON gate.dbo.Payment (Status);

CREATE INDEX ixSDate ON gate.dbo.Payment (SDate)
