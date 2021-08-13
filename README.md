# Prodcut_ROAS_Report
專案目的:
挖掘潛力商品

專案流程簡述:
1.透過Google Analytics report api取得在該月份每一個商品網頁的PageViews,Sessions
2.從資料庫中撈取該月費所有商品消費紀錄以及加入購物車紀錄
3.將兩份資料用商品ID當作key值mapping
4.把消費紀錄中的營業額當作分母,網頁PageViews當作分母 算出商品的ROAS 由高到低排序
5.最後根據加入購物車數量,訂單數,購買會員數,及毛利率等指標來判斷是否為潛力商品

專案執行方式:
語言:Python,Mysql
套件:Pandas,GA-Pandas
工具:Jupyter Notebook,Mysql Workbench,Google Analytics report api
呈現方式:Excel




