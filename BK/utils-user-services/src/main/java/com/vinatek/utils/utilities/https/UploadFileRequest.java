package com.vinatek.utils.utilities.https;

public class UploadFileRequest {
    private String fileName;
    private String base64Data;
    private int uploadType;

    public UploadFileRequest() {
    }

    public UploadFileRequest(String fileName, String base64Data, int uploadType) {
        this.fileName = fileName;
        this.base64Data = base64Data;
        this.uploadType = uploadType;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getBase64Data() {
        return base64Data;
    }

    public void setBase64Data(String base64Data) {
        this.base64Data = base64Data;
    }

    public int getUploadType() {
        return uploadType;
    }

    public void setUploadType(int uploadType) {
        this.uploadType = uploadType;
    }
}
