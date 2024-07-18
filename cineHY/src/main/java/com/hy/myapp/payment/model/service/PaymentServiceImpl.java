package com.hy.myapp.payment.model.service;

import java.io.IOException;
import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.hy.myapp.payment.model.repository.PaymentRepository;
import com.hy.myapp.payment.model.repository.PrePaymentRepository;
import com.hy.myapp.payment.model.vo.PaymentVO;
import com.hy.myapp.payment.model.vo.PrePaymentVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.request.PrepareData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@PropertySource("classpath:api.properties")
public class PaymentServiceImpl implements PaymentService {

	private IamportClient api;
	
	@Autowired
	private PrePaymentRepository prePaymentRepository;
	
	@Autowired
	private PaymentRepository paymentRepository;
	
	@Value("${api.key}")
	private String key;
	
	@Value("${api.secret}")
	private String secret;
	
	
	
	public PaymentServiceImpl() {
		this.api = new IamportClient("8006731832536307", "Rzaw0rU4BFImk2cqDjAGXcGywGGgAzLfy16909OPBxtvdxzEe1zzWonqmoQwdbiJN45sSaGqTXc1BMJs");
	}

	public void postPrepare(PrePaymentVO request) throws IamportResponseException, IOException {
		PrepareData prepareData = new PrepareData(request.getMerchantUid(), request.getAmount());
		api.postPrepare(prepareData);			// 사전 등록 API
		
		//log.info("key {}", key);
		//log.info("key {}", secret);
		//log.info("이게 뭔데 : {}", request.getMerchantUid());
		
		prePaymentRepository.save(request);			// 주문번호와 결제 예정 금액 DB 저장
		
	}

	public Payment validatePayment(PaymentVO request) throws IamportResponseException, IOException {
		PrePaymentVO prePayment = prePaymentRepository.findById(request.getMerchantUid());
		BigDecimal preAmount = prePayment.getAmount();			// DB에 저장된 결제요청 금액
		
		
		IamportResponse<Payment> iamportResponse = api.paymentByImpUid(request.getImpUid());
		BigDecimal paidAmount = iamportResponse.getResponse().getAmount();			// 사용자가 실제 결제한 금액
		
		//log.info("이게 뭔데 : {}", request.getImpUid());
		
		if(!(preAmount.compareTo(paidAmount) == 0)) {
			CancelData cancelData = cancelPayment(iamportResponse);
			api.cancelPaymentByImpUid(cancelData);
		} 
		
		return iamportResponse.getResponse();
	}
	
	public CancelData cancelPayment(IamportResponse<Payment> response) {
		return new CancelData(response.getResponse().getImpUid(), true);
	}

	public int savePay(Payment payment) {
		return paymentRepository.savePay(payment);
	}
}
