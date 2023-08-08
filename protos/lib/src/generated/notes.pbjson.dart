//
//  Generated code. Do not modify.
//  source: notes.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use todoDescriptor instead')
const Todo$json = {
  '1': 'Todo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'completed', '3': 6, '4': 1, '5': 8, '10': 'completed'},
    {'1': 'noteId', '3': 3, '4': 1, '5': 9, '10': 'noteId'},
  ],
};

/// Descriptor for `Todo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoDescriptor = $convert.base64Decode(
    'CgRUb2RvEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSHAoJY29tcGxldG'
    'VkGAYgASgIUgljb21wbGV0ZWQSFgoGbm90ZUlkGAMgASgJUgZub3RlSWQ=');

@$core.Deprecated('Use noteDescriptor instead')
const Note$json = {
  '1': 'Note',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'color', '3': 3, '4': 1, '5': 3, '10': 'color'},
    {'1': 'timeInEpoch', '3': 4, '4': 1, '5': 3, '10': 'timeInEpoch'},
  ],
};

/// Descriptor for `Note`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noteDescriptor = $convert.base64Decode(
    'CgROb3RlEg4KAmlkGAEgASgJUgJpZBIYCgdjb250ZW50GAIgASgJUgdjb250ZW50EhQKBWNvbG'
    '9yGAMgASgDUgVjb2xvchIgCgt0aW1lSW5FcG9jaBgEIAEoA1ILdGltZUluRXBvY2g=');

@$core.Deprecated('Use noteAllResponseDescriptor instead')
const NoteAllResponse$json = {
  '1': 'NoteAllResponse',
  '2': [
    {'1': 'notes', '3': 1, '4': 3, '5': 11, '6': '.NoteWithTodos', '10': 'notes'},
  ],
};

/// Descriptor for `NoteAllResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noteAllResponseDescriptor = $convert.base64Decode(
    'Cg9Ob3RlQWxsUmVzcG9uc2USJAoFbm90ZXMYASADKAsyDi5Ob3RlV2l0aFRvZG9zUgVub3Rlcw'
    '==');

@$core.Deprecated('Use noteWithTodosDescriptor instead')
const NoteWithTodos$json = {
  '1': 'NoteWithTodos',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.Note', '10': 'note'},
    {'1': 'todos', '3': 2, '4': 3, '5': 11, '6': '.Todo', '10': 'todos'},
  ],
};

/// Descriptor for `NoteWithTodos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noteWithTodosDescriptor = $convert.base64Decode(
    'Cg1Ob3RlV2l0aFRvZG9zEhkKBG5vdGUYASABKAsyBS5Ob3RlUgRub3RlEhsKBXRvZG9zGAIgAy'
    'gLMgUuVG9kb1IFdG9kb3M=');

@$core.Deprecated('Use todoAllRequestDescriptor instead')
const TodoAllRequest$json = {
  '1': 'TodoAllRequest',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 11, '6': '.Note', '10': 'note'},
  ],
};

/// Descriptor for `TodoAllRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoAllRequestDescriptor = $convert.base64Decode(
    'Cg5Ub2RvQWxsUmVxdWVzdBIZCgRub3RlGAEgASgLMgUuTm90ZVIEbm90ZQ==');

@$core.Deprecated('Use todoListDescriptor instead')
const TodoList$json = {
  '1': 'TodoList',
  '2': [
    {'1': 'todos', '3': 1, '4': 3, '5': 11, '6': '.Todo', '10': 'todos'},
  ],
};

/// Descriptor for `TodoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoListDescriptor = $convert.base64Decode(
    'CghUb2RvTGlzdBIbCgV0b2RvcxgBIAMoCzIFLlRvZG9SBXRvZG9z');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

