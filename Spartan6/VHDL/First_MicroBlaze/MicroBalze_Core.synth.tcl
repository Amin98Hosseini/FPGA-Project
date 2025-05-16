proc pnsynth {} {
  cd C:/Users/Amin/Desktop/ChipScope-Session-4-Examles/First_MicroBlaze/MicroBalze_Core
  if { [ catch { xload xmp MicroBalze_Core.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
