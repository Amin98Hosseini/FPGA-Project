cd C:/Users/Amin/Desktop/ChipScope-Session-4-Examles/First_MicroBlaze/MicroBalze_Core
if { [ catch { xload xmp MicroBalze_Core.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
