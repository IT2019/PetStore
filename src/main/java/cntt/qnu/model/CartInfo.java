package cntt.qnu.model;

import java.util.ArrayList;
import java.util.List;
public class CartInfo {

	private int orderNum;
    private CustomerInfo customerInfo;
    private final List<Cart> listItem = new ArrayList<Cart>();
 
    public CartInfo() {
 
    }
 
    public int getOrderNum() {
        return orderNum;
    }
    public void setOrderNum(final int orderNum) {
        this.orderNum = orderNum;
    }
    public CustomerInfo getCustomerInfo() {
        return customerInfo;
    }
    public void setCustomerInfo(final CustomerInfo customerInfo) {
        this.customerInfo = customerInfo;
    }
    public List<Cart> getCartLines() {
        return this.listItem;
    }
 
    private Cart findLineByCode(final String code) {
        for (final Cart item : this.listItem) {
            String vatNuoiID=(item.getVatNuoiInfo().getId()+"").toString();
            if(vatNuoiID.equals(code)) {
                return item;
            }
        }
        return null;
    }
 
    public void addVatNuoi(final VatNuoiInfo vatNuoiInfo, final int quantity) {
        String vatNuoiID=(vatNuoiInfo.getId()+"").toString();
        Cart item = this.findLineByCode(vatNuoiID);
 
        if (item == null) {
        	item = new Cart();
        	item.setQuantity(0);
        	item.setVatNuoiInfo(vatNuoiInfo);
        	this.listItem.add(item);
        }
        final int newQuantity = item.getQuantity() + quantity;
        if (newQuantity <= 0) {
            this.listItem.remove(item);
        } else {
            item.setQuantity(newQuantity);
        }
    }
 
    public void validate() {
 
    }
 
    public void updateVatNuoi(final String code, final String quantity) {
    	if (code.contains(",")) {
    		final String tempCode[] = code.trim().split(",");
			final String tempQuantity[] = quantity.trim().split(",");
			
			for (int i = 0; i < tempCode.length; i++) {
				final Cart item = this.findLineByCode(tempCode[i]);
				
				if (item != null) {
		            if (Integer.parseInt(tempQuantity[i].trim()) <= 0) {
		                this.listItem.remove(item);
		            } else {
		            	item.setQuantity(Integer.parseInt(tempQuantity[i]));
		            }
		        }
			}
    	} else {
    		final Cart item = this.findLineByCode(code);
    		
    		if (item != null) {
	            if (Integer.parseInt(quantity) <= 0) {
	                this.listItem.remove(item);
	            } else {
	            	item.setQuantity(Integer.parseInt(quantity));
	            }
	        }
    	}    
    }
 
    public void removeVatNuoi(final VatNuoiInfo vatNuoiInfo) {
        String vatNuoiID=(vatNuoiInfo.getId()+"").toString();
        final Cart line = this.findLineByCode(vatNuoiID);
        if (line != null) {
            this.listItem.remove(line);
        }
    }
 
    public boolean isEmpty() {
        return this.listItem.isEmpty();
    }
 
    public boolean isValidCustomer() {
        return this.customerInfo != null && this.customerInfo.isValid();
    }
 
    public int getQuantityTotal() {
        int quantity = 0;
        for (final Cart item : this.listItem) {
            quantity += item.getQuantity();
        }
        return quantity;
    }
 
    public double getAmountTotal() {
        double total = 0;
        for (final Cart item : this.listItem) {
            total += item.getAmount();
        }
        return total;
    }
}