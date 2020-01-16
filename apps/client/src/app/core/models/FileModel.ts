export class FileModel {
  public constructor(
    public file: any, public fileBase64: any, public fileName: string, public fileSize: number,
    public fileType: string) {
  }
}
