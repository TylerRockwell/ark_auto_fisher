F2::
enabled = 0
return

F3::
enabled = 1
fishing_keys := StrSplit("qweasdzxc")

while(enabled == 1)
{
  color = 0xFFFFFF
  ; if(ErrorLevel = 0)
  ; {
  ;   MsgBox % letter
  ;   SendInput %letter%
  ; }
  key_coordinates := { q : { x_coord: 1180, y_coord: 1020 }
    , w: { x_coord: 1210, y_coord: 865}
    , x: { x_coord: 1191, y_coord: 862}
    , }
  ; PixelSearch, px, py, 1180, 1020, 1180, 1020, color, 3, Fast
}
return
