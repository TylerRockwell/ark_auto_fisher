SearchForLetter(x, y) {
  PixelSearch, px, py, x, y, x, y, 0xFFFFFF, 3, Fast
  return !ErrorLevel ; returns 1 if found, 0 otherwise
}

SearchForEasyLetters() {
  key_coordinates := { q : { x_coord: 1180, y_coord: 1020 }
    , w: { x_coord: 1210, y_coord: 865 }
    , a: { x_coord: 1162, y_coord: 970 }
    , x: { x_coord: 1191, y_coord: 862 }
    , d: { x_coord: 1134, y_coord: 863 } }

  For key, coords in key_coordinates
  {
    result := SearchForLetter(coords.x_coord, coords.y_coord)
    if result
      return %key%
  }
}

; TODO: Consolidate these
SearchForS(){
  if SearchForLetter(1168, 857) && SearchForLetter(1169, 921)
    return "s"
}

SearchForZ(){
  if SearchForLetter(1184, 861) && SearchForLetter(1158, 979)
    return "z"
}

SearchForC(){
  if SearchForLetter(1168, 857) && SearchForLetter(1143, 940) && !SearchForLetter(1182, 915)
  return "c"
}

SearchForE(){
  if SearchForLetter(1164, 865) && SearchForLetter(1158, 939) && SearchForLetter(1163, 995)
    return "e"
}

CastLine(){
  PixelSearch, px, py, 942, 538, 942, 538, 0x33C1BB, 3, Fast RGB
  if !ErrorLevel
    Click
}

F2::
enabled = 0
return

F3::
enabled = 1

while enabled
{
  search_functions := ["SearchForEasyLetters"
    , "SearchForS"
    , "SearchForZ"
    , "SearchForC"
    , "SearchForE"]

  for _, function in search_functions{
    key := %function%()
    if key
    {
        SendInput %key%
        FileAppend, Pressed %key% `n, fishing_log.txt
        Sleep 1000 ; Allow the text on screen to change
        break
    }
  }
  CastLine()
}
return
