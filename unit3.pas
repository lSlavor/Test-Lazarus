unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFillBucketWindow }

  TFillBucketWindow = class(TForm)
    ButtonCancel: TButton;
    procedure Cancel(Sender: TObject);
  private

  public

  end;

var
  FillBucketWindow: TFillBucketWindow; Test: String;

implementation

{$R *.lfm}

{ TFillBucketWindow }

procedure TFillBucketWindow.Cancel(Sender: TObject);
begin
  Close;
end;

end.

