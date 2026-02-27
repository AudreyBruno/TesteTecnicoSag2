inherited frmViewEditLote: TfrmViewEditLote
  Caption = 'frmViewEditLote'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited lblTitle: TLabel
    StyleElements = [seFont, seClient, seBorder]
  end
  object Label1: TLabel [1]
    Left = 40
    Top = 120
    Width = 67
    Height = 15
    Caption = 'Data Entrada'
  end
  object Label2: TLabel [2]
    Left = 40
    Top = 56
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel [3]
    Left = 40
    Top = 184
    Width = 96
    Height = 15
    Caption = 'Quantidade Inicial'
  end
  inherited pFooter: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pBtnCancel: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited pBtnSave: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  object edtDescricao: TEdit
    Left = 40
    Top = 77
    Width = 186
    Height = 23
    TabOrder = 1
  end
  object edtQtd: TEdit
    Left = 40
    Top = 205
    Width = 186
    Height = 23
    TabOrder = 2
  end
  object edtDate: TDateTimePicker
    Left = 40
    Top = 141
    Width = 186
    Height = 23
    Date = 46080.000000000000000000
    Time = 0.482455219906114500
    TabOrder = 3
  end
end
