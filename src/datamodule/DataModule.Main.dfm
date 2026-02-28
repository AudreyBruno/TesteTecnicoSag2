object DMMain: TDMMain
  Height = 247
  Width = 382
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Audrey\Desktop\ABDB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 176
    Top = 104
  end
end
