package net.sourceforge.fenixedu.domain.tests;

import net.sourceforge.fenixedu.domain.accessControl.Group;

public class PictureMaterialFile extends PictureMaterialFile_Base {

    public PictureMaterialFile() {
        super();
    }

    public PictureMaterialFile(String filename, String displayName, byte[] content, Group permittedGroup) {
        this();
        init(filename, displayName, content, permittedGroup);
    }

    public void delete(NewPictureMaterial pictureMaterial) {
        this.removePictureMaterials(pictureMaterial);
        if (this.getPictureMaterialsSet().size() == 0) {
            super.delete();
        }
    }

    @Deprecated
    public java.util.Set<net.sourceforge.fenixedu.domain.tests.NewPictureMaterial> getPictureMaterials() {
        return getPictureMaterialsSet();
    }

    @Deprecated
    public boolean hasAnyPictureMaterials() {
        return !getPictureMaterialsSet().isEmpty();
    }

}
