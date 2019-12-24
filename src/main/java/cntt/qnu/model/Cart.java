package cntt.qnu.model;


public class Cart {
 
    private VatNuoiInfo vatNuoiInfo;
    private int quantity;
 
    public Cart() {
    }
 
    public Cart(VatNuoiInfo vatNuoiInfo, int quantity) {
        this.vatNuoiInfo = vatNuoiInfo;
        this.quantity = quantity;
    }
 
    public VatNuoiInfo getVatNuoiInfo() {
        return vatNuoiInfo;
    }
 
    public void setVatNuoiInfo(VatNuoiInfo vatNuoiInfo) {
        this.vatNuoiInfo = vatNuoiInfo;
    }
 
    public int getQuantity() {
        return quantity;
    }
 
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getAmount() {
        return this.vatNuoiInfo.getGiatien() * this.quantity;
    }
}