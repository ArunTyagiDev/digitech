<x-front-layout>
	<section class="max-w-5xl mx-auto px-4 py-10" x-data="{ method: 'qr' }">
		<h1 class="text-2xl font-semibold">Checkout</h1>
		<div class="grid md:grid-cols-3 gap-8 mt-6">
			<div class="md:col-span-2">
				<form method="post" action="{{ route('checkout.place') }}" enctype="multipart/form-data" class="space-y-6">
					@csrf
					<input type="hidden" name="payment_method" :value="method">

					<div class="grid sm:grid-cols-2 gap-4">
						<div>
							<label class="block text-sm text-gray-300">Name</label>
							<input name="name" value="{{ old('name') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
							@error('name')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
						</div>
						<div>
							<label class="block text-sm text-gray-300">Email</label>
							<input type="email" name="email" value="{{ old('email') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
							@error('email')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
						</div>
					</div>
					<div class="grid sm:grid-cols-2 gap-4">
						<div>
							<label class="block text-sm text-gray-300">Phone</label>
							<input name="phone" value="{{ old('phone') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
						</div>
						<div>
							<label class="block text-sm text-gray-300">Payment Reference (optional)</label>
							<input name="payment_reference" value="{{ old('payment_reference') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
						</div>
					</div>
					<div>
						<label class="block text-sm text-gray-300">Address (optional)</label>
						<textarea name="address" rows="3" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2">{{ old('address') }}</textarea>
					</div>
					<div>
						<label class="block text-sm text-gray-300">Notes (optional)</label>
						<textarea name="notes" rows="3" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2">{{ old('notes') }}</textarea>
					</div>

					<div>
						<div class="flex gap-3">
							<button type="button" @click="method='card'"
								class="px-4 py-2 rounded border"
								:class="method==='card' ? 'bg-yellow-400 text-black border-yellow-300' : 'bg-brand-gray-800 border-brand-gray-700'">Online Payment</button>
							<button type="button" @click="method='qr'"
								class="px-4 py-2 rounded border"
								:class="method==='qr' ? 'bg-yellow-400 text-black border-yellow-300' : 'bg-brand-gray-800 border-brand-gray-700'">Scanner Payment</button>
						</div>

						<!-- Card form -->
						<div x-show="method==='card'" x-cloak class="mt-4 border border-brand-gray-800 rounded-xl p-4 bg-brand-gray-800/40 space-y-4">
							<div class="text-sm text-gray-300">Enter your card details. We do not store full card data; only last 4 will be kept for reference.</div>
							<div>
								<label class="block text-sm text-gray-300">Name on Card</label>
								<input name="card_name" value="{{ old('card_name') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
								@error('card_name')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
							</div>
							<div>
								<label class="block text-sm text-gray-300">Card Number</label>
								<input name="card_number" inputmode="numeric" autocomplete="cc-number" value="{{ old('card_number') }}" placeholder="4242 4242 4242 4242" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2 tracking-widest" />
								@error('card_number')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
							</div>
							<div class="grid grid-cols-3 gap-4">
								<div>
									<label class="block text-sm text-gray-300">Exp. Month</label>
									<input name="card_exp_month" inputmode="numeric" value="{{ old('card_exp_month') }}" placeholder="MM" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
									@error('card_exp_month')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
								</div>
								<div>
									<label class="block text-sm text-gray-300">Exp. Year</label>
									<input name="card_exp_year" inputmode="numeric" value="{{ old('card_exp_year') }}" placeholder="YY or YYYY" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
									@error('card_exp_year')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
								</div>
								<div>
									<label class="block text-sm text-gray-300">CVC</label>
									<input name="card_cvc" inputmode="numeric" value="{{ old('card_cvc') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
									@error('card_cvc')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
								</div>
							</div>
						</div>

						<!-- QR form -->
						<div x-show="method==='qr'" x-cloak class="mt-4 border border-brand-gray-800 rounded-xl p-4 bg-brand-gray-800/40 space-y-4">
							<div class="font-semibold">Scan to Pay</div>
							<div class="text-sm text-gray-400">Use your UPI app to scan & pay. Include your name in remarks.</div>
							@php
								$payeeName = $payee ?: config('app.name', 'Merchant');
								// Sanitize payee name to avoid special chars some UPI apps reject
								$payeeNameClean = preg_replace('/[^A-Za-z0-9\\.\\- ]/', '', (string) $payeeName);
								$amount = $subtotal; // already 2-decimals, no thousands separator
								$tn = 'Order payment';
								// Keep params minimal to avoid app-side blocks
								$minimalParams = [
									'pa' => $upiId,
									'pn' => $payeeNameClean,
									'am' => $amount,
									'cu' => 'INR',
									'tn' => $tn,
								];
								$build = function ($params) {
									return implode('&', array_map(function ($k) use ($params) {
										return $k.'='.urlencode($params[$k]);
									}, array_keys($params)));
								};
								$params = $build($minimalParams);
								$upiGeneric = 'upi://pay?'.$params;
								$noAmountParams = $minimalParams; unset($noAmountParams['am']);
								$upiNoAmount = 'upi://pay?'.$build($noAmountParams);
								$intentPhonePe = 'intent://upi/pay?'.$params.'#Intent;scheme=upi;package=com.phonepe.app;end';
								$intentGPay = 'intent://upi/pay?'.$params.'#Intent;scheme=upi;package=com.google.android.apps.nbu.paisa.user;end';
								$intentPaytm = 'intent://upi/pay?'.$params.'#Intent;scheme=upi;package=net.one97.paytm;end';
								// iOS app schemes
								$schemePhonePe = 'phonepe://pay?'.$params;
								$schemePaytm = 'paytmmp://upi_pay?'.$params;
								$schemeGPay1 = 'gpay://upi/pay?'.$params;
								$schemeGPay2 = 'tez://upi/pay?'.$params;
							@endphp
							<div>
								<button type="button" id="upi-pay-now" class="px-4 py-2 rounded border border-yellow-400 text-black bg-yellow-400 hover:opacity-90">Pay via UPI Now</button>
								<div class="text-xs text-gray-500 mt-2">This will try Google Pay, PhonePe, Paytm, then show your UPI app list.</div>
							</div>
							<div class="mt-3 aspect-square border border-brand-gray-800 rounded bg-brand-gray-900 flex items-center justify-center">
								@php $exists = file_exists(public_path($qrPath)); @endphp
								@if($exists)
									<img src="{{ asset($qrPath) }}" alt="Payment QR" class="w-full h-full object-contain p-4" />
								@else
									<div class="text-gray-500 text-center p-6">Place your QR at <code class="text-yellow-400">public/{{ $qrPath }}</code></div>
								@endif
							</div>
							@if($upiId || $payee)
								<div class="text-sm text-gray-300">
									@if($payee)<div>Payee: {{ $payee }}</div>@endif
									@if($upiId)
										<div class="flex items-center gap-2">
											<span>UPI ID: {{ $upiId }}</span>
											<button type="button" class="text-xs px-2 py-1 border border-brand-gray-700 rounded hover:border-yellow-400" onclick="navigator.clipboard && navigator.clipboard.writeText('{{ $upiId }}')">Copy</button>
										</div>
									@endif
									<div class="flex items-center gap-2">
										<span>Amount: ₹{{ number_format($subtotal, 2) }}</span>
										<button type="button" class="text-xs px-2 py-1 border border-brand-gray-700 rounded hover:border-yellow-400" onclick="navigator.clipboard && navigator.clipboard.writeText('{{ $subtotal }}')">Copy</button>
									</div>
								</div>
							@endif
							<div class="grid sm:grid-cols-3 gap-3">
								<a id="btn-phonepe" href="{{ $intentPhonePe }}" class="px-3 py-2 text-center rounded border border-brand-gray-700 hover:border-yellow-400 flex items-center justify-center gap-2">
									<img src="{{ asset('payments/logos/phonepe.svg') }}" alt="PhonePe" class="h-6 w-auto" />
									<span>PhonePe</span>
								</a>
								<a id="btn-paytm" href="{{ $intentPaytm }}" class="px-3 py-2 text-center rounded border border-brand-gray-700 hover:border-yellow-400 flex items-center justify-center gap-2">
									<img src="{{ asset('payments/logos/paytm.svg') }}" alt="Paytm" class="h-6 w-auto" />
									<span>Paytm</span>
								</a>
								<a id="btn-gpay" href="{{ $intentGPay }}" class="px-3 py-2 text-center rounded border border-brand-gray-700 hover:border-yellow-400 flex items-center justify-center gap-2">
									<img src="{{ asset('payments/logos/gpay.svg') }}" alt="Google Pay" class="h-6 w-auto" />
									<span>Google Pay</span>
								</a>
							</div>
							<div class="text-xs text-gray-500 space-y-1">
								<div>If the buttons don’t open your app, <a href="{{ $upiGeneric }}" class="text-yellow-400 underline">tap here</a> to choose a UPI app.</div>
								<div>If your app shows the UPI ID as blocked, <a href="{{ $upiNoAmount }}" class="text-yellow-400 underline">open without amount</a> and enter ₹{{ number_format($subtotal, 2) }} manually.</div>
							</div>
							<div>
								<label class="block text-sm text-gray-300">Upload Payment Screenshot (optional)</label>
								<input type="file" name="payment_screenshot" accept="image/*" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
								@error('payment_screenshot')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
							</div>
						</div>
					</div>

					<div class="text-right">
						<button class="px-5 py-3 bg-yellow-400 text-black rounded">Place Order</button>
					</div>
				</form>
			</div>
			<div>
				<div class="border border-brand-gray-800 rounded-xl p-4 bg-brand-gray-800/40">
					<div class="font-semibold mb-2">Order Summary</div>
					<ul class="space-y-2 text-sm text-gray-300 max-h-64 overflow-auto pr-1">
						@foreach($items as $row)
							<li class="flex justify-between gap-4">
								<span>{{ $row['product']->name }} × {{ $row['quantity'] }}</span>
								<span class="flex items-center gap-3">
									<form method="post" action="{{ route('cart.remove', $row['product']) }}">
										@csrf
										@method('DELETE')
										<button type="submit" class="text-xs text-red-400 hover:underline">Remove</button>
									</form>
									<span>₹{{ number_format($row['line_total'], 2) }}</span>
								</span>
							</li>
						@endforeach
					</ul>
					<div class="mt-3 flex justify-between font-medium"><span>Subtotal</span><span>₹{{ number_format($subtotal, 2) }}</span></div>
				</div>
			</div>
		</div>
	</section>
	<script>
		(function () {
			function openUri(uri) {
				window.location.href = uri;
			}
			function tryIntents(intents, fallback) {
				let idx = 0;
				function next() {
					if (idx >= intents.length) {
						if (fallback) openUri(fallback);
						return;
					}
					try {
						openUri(intents[idx++]);
						setTimeout(next, 1200);
					} catch (e) {
						next();
					}
				}
				next();
			}
			window.addEventListener('load', function () {
				var payBtn = document.getElementById('upi-pay-now');
				var btnPhonePe = document.getElementById('btn-phonepe');
				var btnPaytm = document.getElementById('btn-paytm');
				var btnGPay = document.getElementById('btn-gpay');
				if (payBtn) {
					payBtn.addEventListener('click', function () {
						var isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
						if (isIOS) {
							tryIntents(
								[
									'{{ $schemePhonePe }}',
									'{{ $schemePaytm }}'
								],
								'{{ $upiGeneric }}'
							);
						} else {
							tryIntents(
								[
									'{{ $intentGPay }}',
									'{{ $intentPhonePe }}',
									'{{ $intentPaytm }}'
								],
								'{{ $upiGeneric }}'
							);
						}
					});
				}
				function attachAppHandler(el, intents, fallback) {
					if (!el) return;
					el.addEventListener('click', function (e) {
						e.preventDefault();
						tryIntents(intents, fallback);
					});
				}
				var isIOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
				if (isIOS) {
					attachAppHandler(btnPhonePe, ['{{ $schemePhonePe }}'], '{{ $upiGeneric }}');
					attachAppHandler(btnPaytm, ['{{ $schemePaytm }}'], '{{ $upiGeneric }}');
					attachAppHandler(btnGPay, ['{{ $schemeGPay1 }}', '{{ $schemeGPay2 }}'], '{{ $upiGeneric }}');
				} else {
					attachAppHandler(btnPhonePe, ['{{ $intentPhonePe }}'], '{{ $upiGeneric }}');
					attachAppHandler(btnPaytm, ['{{ $intentPaytm }}'], '{{ $upiGeneric }}');
					attachAppHandler(btnGPay, ['{{ $intentGPay }}'], '{{ $upiGeneric }}');
				}
			});
		})();
	</script>
</x-front-layout>
