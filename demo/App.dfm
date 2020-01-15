object Form1: TForm1
  Left = 355
  Top = 205
  Width = 350
  Height = 105
  Caption = 'Render metafile test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object bRenderMetafile: TButton
    Left = 16
    Top = 16
    Width = 201
    Height = 25
    Caption = 'Render'
    TabOrder = 0
    OnClick = RenderMetafile
  end
  object cbOpenResult: TCheckBox
    Left = 236
    Top = 20
    Width = 77
    Height = 17
    Caption = 'Open result'
    TabOrder = 1
  end
end
