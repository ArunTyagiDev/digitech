@extends('layouts.app')

@section('content')
<div class="max-w-3xl mx-auto py-8 px-4">
    <h1 class="text-2xl font-semibold text-gray-100 mb-6">Enquiry Details</h1>
    @if(session('status'))
        <div class="mb-4 p-3 rounded bg-green-600/20 text-green-300 border border-green-600/30">{{ session('status') }}</div>
    @endif
    <div class="space-y-2 text-sm text-gray-300">
        <div><span class="text-gray-400">Name:</span> {{ $enquiry->name }}</div>
        <div><span class="text-gray-400">Email:</span> {{ $enquiry->email }}</div>
        <div><span class="text-gray-400">Phone:</span> {{ $enquiry->phone ?? '-' }}</div>
        <div><span class="text-gray-400">Message:</span> {{ $enquiry->message ?? '-' }}</div>
        <div><span class="text-gray-400">Items:</span>
            <pre class="mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded p-3">{{ json_encode($enquiry->items, JSON_PRETTY_PRINT|JSON_UNESCAPED_SLASHES) }}</pre>
        </div>
    </div>
    <form method="post" action="{{ route('admin.enquiries.update', $enquiry) }}" class="mt-6 grid gap-4">
        @csrf
        @method('PUT')
        <div>
            <label class="block text-sm text-gray-300">Status</label>
            <select name="status" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2">
                @foreach(['new','contacted','closed'] as $status)
                    <option value="{{ $status }}" @selected($enquiry->status===$status)>{{ ucfirst($status) }}</option>
                @endforeach
            </select>
        </div>
        <div>
            <label class="block text-sm text-gray-300">Admin Notes</label>
            <textarea name="admin_notes" rows="4" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2">{{ old('admin_notes', $enquiry->admin_notes) }}</textarea>
        </div>
        <div>
            <button class="px-5 py-3 bg-yellow-400 text-black rounded">Update</button>
        </div>
    </form>
</div>
@endsection

