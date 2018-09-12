mol new ../InwardFacing_glu/step5_assembly.xplor_ext.psf
mol addfile in_100ns.pdb
mol new ../Protonated_glucose/step5_assembly.xplor_ext.psf
mol addfile ../Protonated_glucose/namd/7.7.coor
#
# one by one align all of the atoms atop their new 
# coordinates from protg
for {set i 2 } { $i <= 480 } { incr i } {
    set prot [atomselect 0 "alpha and resid $i"]
    set inoc [atomselect 1 "alpha and resid $i"]
    set pos [$prot get {x y z}]
    $inoc moveto [lindex $pos 0]
    $prot delete
    $inoc delete
    unset pos
}

set all [atomselect 1 "segname PROA CARA CARB"]
$all writepdb prot_alpha.pdb
$all delete
exit
