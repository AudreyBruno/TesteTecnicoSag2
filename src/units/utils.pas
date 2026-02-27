unit utils;

interface

uses System.SysUtils;

type
  TUtils = class
  public
    class function formatTitle(const FieldName: string): string;
  end;

implementation

class function TUtils.formatTitle(const FieldName: string): string;
var
  parts: TArray<string>;
  i: Integer;
begin
  parts := FieldName.ToLower.Split(['_']);

  for i := 0 to High(parts) do
    if parts[i] <> '' then
      parts[i] := UpperCase(parts[i][1]) + Copy(parts[i], 2, Length(parts[i]));

  Result := string.Join(' ', parts);
end;

end.
