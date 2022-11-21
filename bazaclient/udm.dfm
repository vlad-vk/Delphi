object DM: TDM
  OldCreateOrder = False
  Left = 141
  Top = 133
  Height = 611
  Width = 782
  object IBDatabase1: TIBDatabase
    DatabaseName = '127.0.0.1:C:\BAZA\BASE.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 81
    Top = 113
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 83
    Top = 161
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 640
    Top = 15
  end
  object IBQ_bd: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 180
    Top = 112
  end
  object ds_bd: TDataSource
    DataSet = IBQ_bd
    Left = 176
    Top = 161
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 84
    Top = 258
  end
  object IBQ_bd_a1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 290
    Top = 112
  end
  object ds_bd_a1: TDataSource
    DataSet = IBQ_bd_a1
    Left = 292
    Top = 160
  end
  object IBQ_bd_a2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 354
    Top = 112
  end
  object ds_bd_a2: TDataSource
    DataSet = IBQ_bd_a2
    Left = 356
    Top = 160
  end
  object IBQ_bd_a3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 426
    Top = 112
  end
  object ds_bd_a3: TDataSource
    DataSet = IBQ_bd_a3
    Left = 428
    Top = 160
  end
  object IBQ_bd_a4: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 498
    Top = 112
  end
  object ds_bd_a4: TDataSource
    DataSet = IBQ_bd_a4
    Left = 500
    Top = 160
  end
  object IBQ_gr_tds: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 188
    Top = 258
  end
  object IBQ_gr_dsdm: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 256
    Top = 258
  end
  object IBQ_gr_pp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 331
    Top = 258
  end
  object IBQ_gr_a1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 189
    Top = 305
  end
  object IBQ_gr_a2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 258
    Top = 305
  end
  object IBQ_gr_a3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 333
    Top = 305
  end
  object IBQ_gr_a4: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 401
    Top = 305
  end
  object IBQ_gr_tmp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 190
    Top = 362
  end
  object IBQ_bd_a5: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 570
    Top = 112
  end
  object ds_bd_a5: TDataSource
    DataSet = IBQ_bd_a5
    Left = 572
    Top = 160
  end
  object IBQ_bd_a6: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 642
    Top = 112
  end
  object ds_bd_a6: TDataSource
    DataSet = IBQ_bd_a6
    Left = 644
    Top = 160
  end
  object IBQ_gr_a5: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 465
    Top = 305
  end
  object IBQ_gr_a6: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from NTABLE')
    Left = 529
    Top = 305
  end
end
