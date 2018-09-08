set sel [atomselect top all]
set name [lindex $arv 0]
$sel writepdb $name.pdb
