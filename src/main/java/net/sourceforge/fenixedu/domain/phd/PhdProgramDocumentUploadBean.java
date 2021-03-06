package net.sourceforge.fenixedu.domain.phd;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

import pt.utl.ist.fenix.tools.util.FileUtils;

public class PhdProgramDocumentUploadBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private PhdIndividualProgramDocumentType type;

    private transient InputStream file;

    private byte[] fileContent;

    private String filename;

    private String remarks;

    private PhdIndividualProgramProcess individualProgramProcess;

    private boolean required = false;

    public PhdProgramDocumentUploadBean() {

    }

    public PhdProgramDocumentUploadBean(PhdIndividualProgramDocumentType type) {
        setType(type);
    }

    public byte[] getFileContent() {
        return this.fileContent;
    }

    public PhdIndividualProgramDocumentType getType() {
        return type;
    }

    public void setType(PhdIndividualProgramDocumentType type) {
        this.type = type;
    }

    public InputStream getFile() {
        return file;
    }

    public void setFile(InputStream file) {
        this.file = file;

        if (file != null) {
            final ByteArrayOutputStream result = new ByteArrayOutputStream();
            try {
                FileUtils.copy(this.file, result);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

            this.fileContent = result.toByteArray();
        } else {
            this.fileContent = null;
        }
    }

    public void removeFile() {
        setFile(null);
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public boolean hasAnyInformation() {
        return this.type != null && !StringUtils.isEmpty(this.filename) && this.fileContent != null;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public PhdIndividualProgramProcess getIndividualProgramProcess() {
        return this.individualProgramProcess;
    }

    public void setIndividualProgramProcess(final PhdIndividualProgramProcess individualProgramProcess) {
        this.individualProgramProcess = individualProgramProcess;
    }

    public boolean isRequired() {
        return this.required;
    }

    public PhdProgramDocumentUploadBean required() {
        this.required = !this.required;
        return this;
    }
}
