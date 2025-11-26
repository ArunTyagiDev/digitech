<?php

return [
	'qr_path' => env('PAYMENT_QR_PATH', 'payments/qr.png'),
	'upi_id' => env('PAYMENT_UPI_ID', 'paytmqr2810050501011meg3b1gpdl9@paytm'),
	'payee' => env('PAYMENT_PAYEE'),
	// Optional: helps some UPI apps (not guaranteed) especially Google Pay
	'upi_orgid' => env('PAYMENT_UPI_ORGID'), // e.g. '000000'
	// Optional merchant category code (MCC), e.g. '5411' for grocery stores
	'merchant_category' => env('PAYMENT_MERCHANT_CATEGORY'),
];


