# Global Parameters
colvarsTrajFrequency 1000

colvar {{
    name q1_6
    orientation {{
        atoms {{
            psfSegID PROA PROA PROA PROA PROA PROA
            atomNameResidueRange {{ CA 5-43 }}
            atomNameResidueRange {{ CA 50-82 }}
            atomNameResidueRange {{ CA 85-104 }}
            atomNameResidueRange {{ CA 120-154 }}
            atomNameResidueRange {{ CA 155-187 }}
            atomNameResidueRange {{ CA 191-217 }}
            centerReference on
            rotateReference on
            refPositionsGroup {{
                psfSegID PROA PROA PROA PROA PROA PROA PROA PROA PROA PROA PROA PROA
                atomNameResidueRange {{ CA 5-43 }}
                atomNameResidueRange {{ CA 50-82 }}
                atomNameResidueRange {{ CA 85-104 }}
                atomNameResidueRange {{ CA 120-154 }}
                atomNameResidueRange {{ CA 155-187 }}
                atomNameResidueRange {{ CA 191-217 }}
                atomNameResidueRange {{ CA 271-308 }}
                atomNameResidueRange {{ CA 312-335 }}
                atomNameResidueRange {{ CA 341-368 }}
                atomNameResidueRange {{ CA 369-385,388-398 }}
                atomNameResidueRange {{ CA 403-423 }}
                atomNameResidueRange {{ CA 443-462 }}
            }}
            refPositionsFile {reference_file}
            enableFitGradients off
        }}
        refPositionsFile {reference_file}
    }}
}}

colvar {{
    name q7_12
    orientation {{
        atoms {{
            psfSegID PROA PROA PROA PROA PROA PROA 
            atomNameResidueRange {{ CA 271-308 }}
            atomNameResidueRange {{ CA 312-335 }}
            atomNameResidueRange {{ CA 341-368 }}
            atomNameResidueRange {{ CA 369-385,388-398 }}
            atomNameResidueRange {{ CA 403-423 }}
            atomNameResidueRange {{ CA 443-462 }}
            centerReference on
            rotateReference on
            refPositionsGroup {{
                psfSegID PROA PROA PROA PROA PROA PROA PROA PROA PROA PROA PROA PROA
                atomNameResidueRange {{ CA 5-43 }}
                atomNameResidueRange {{ CA 50-82 }}
                atomNameResidueRange {{ CA 85-104 }}
                atomNameResidueRange {{ CA 120-154 }}
                atomNameResidueRange {{ CA 155-187 }}
                atomNameResidueRange {{ CA 191-217 }}
                atomNameResidueRange {{ CA 271-308 }}
                atomNameResidueRange {{ CA 312-335 }}
                atomNameResidueRange {{ CA 341-368 }}
                atomNameResidueRange {{ CA 369-385,388-398 }}
                atomNameResidueRange {{ CA 403-423 }}
                atomNameResidueRange {{ CA 443-462 }}
            }}
            refPositionsFile {reference_file}
            enableFitGradients off
        }}
        refPositionsFile {reference_file}
    }}
}}
