@extends('layouts.app')

@section('content')
<div class="max-w-7xl mx-auto py-8 px-4">
    <h1 class="text-2xl font-semibold text-gray-100 mb-6">Enquiries</h1>
    @if(session('status'))
        <div class="mb-4 p-3 rounded bg-green-600/20 text-green-300 border border-green-600/30">{{ session('status') }}</div>
    @endif
    <div class="overflow-x-auto border border-brand-gray-800 rounded-xl">
        <table class="min-w-full text-sm">
            <thead>
                <tr class="bg-brand-gray-800 text-gray-300">
                    <th class="text-left px-4 py-2">Name</th>
                    <th class="text-left px-4 py-2">Email</th>
                    <th class="text-left px-4 py-2">Status</th>
                    <th class="text-left px-4 py-2">Date</th>
                    <th class="text-left px-4 py-2">Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($enquiries as $enquiry)
                    <tr class="border-t border-brand-gray-800">
                        <td class="px-4 py-2">{{ $enquiry->name }}</td>
                        <td class="px-4 py-2">{{ $enquiry->email }}</td>
                        <td class="px-4 py-2">{{ ucfirst($enquiry->status) }}</td>
                        <td class="px-4 py-2">{{ $enquiry->created_at->format('Y-m-d H:i') }}</td>
                        <td class="px-4 py-2">
                            <a class="text-yellow-400 hover:underline mr-3" href="{{ route('admin.enquiries.show', $enquiry) }}">View</a>
                            <form method="post" action="{{ route('admin.enquiries.destroy', $enquiry) }}" class="inline">
                                @csrf
                                @method('DELETE')
                                <button class="text-red-400 hover:underline" onclick="return confirm('Delete?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="mt-6">{{ $enquiries->links() }}</div>
</div>
@endsection

