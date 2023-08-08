//
//  Generated code. Do not modify.
//  source: notes.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'notes.pb.dart' as $0;

export 'notes.pb.dart';

@$pb.GrpcServiceName('NoteService')
class NoteServiceClient extends $grpc.Client {
  static final _$all = $grpc.ClientMethod<$0.Empty, $0.NoteAllResponse>(
      '/NoteService/All',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.NoteAllResponse.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<$0.NoteWithTodos, $0.Empty>(
      '/NoteService/Create',
      ($0.NoteWithTodos value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$0.NoteWithTodos, $0.Empty>(
      '/NoteService/Update',
      ($0.NoteWithTodos value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$0.Note, $0.Empty>(
      '/NoteService/Delete',
      ($0.Note value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$allTodos = $grpc.ClientMethod<$0.TodoAllRequest, $0.TodoList>(
      '/NoteService/AllTodos',
      ($0.TodoAllRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TodoList.fromBuffer(value));
  static final _$createTodo = $grpc.ClientMethod<$0.TodoList, $0.Empty>(
      '/NoteService/CreateTodo',
      ($0.TodoList value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$updateTodo = $grpc.ClientMethod<$0.TodoList, $0.Empty>(
      '/NoteService/UpdateTodo',
      ($0.TodoList value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$updateSingleTodo = $grpc.ClientMethod<$0.Todo, $0.Empty>(
      '/NoteService/UpdateSingleTodo',
      ($0.Todo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$deleteTodo = $grpc.ClientMethod<$0.Todo, $0.Empty>(
      '/NoteService/DeleteTodo',
      ($0.Todo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$deleteAllTodos = $grpc.ClientMethod<$0.TodoList, $0.Empty>(
      '/NoteService/DeleteAllTodos',
      ($0.TodoList value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  NoteServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.NoteAllResponse> all($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$all, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Empty> create($async.Stream<$0.NoteWithTodos> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$create, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.Empty> update($async.Stream<$0.NoteWithTodos> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$update, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.Empty> delete($0.Note request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseStream<$0.TodoList> allTodos($0.TodoAllRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$allTodos, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Empty> createTodo($async.Stream<$0.TodoList> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createTodo, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.Empty> updateTodo($async.Stream<$0.TodoList> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$updateTodo, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.Empty> updateSingleTodo($0.Todo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSingleTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteTodo($0.Todo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteAllTodos($async.Stream<$0.TodoList> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$deleteAllTodos, request, options: options).single;
  }
}

@$pb.GrpcServiceName('NoteService')
abstract class NoteServiceBase extends $grpc.Service {
  $core.String get $name => 'NoteService';

  NoteServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.NoteAllResponse>(
        'All',
        all_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.NoteAllResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NoteWithTodos, $0.Empty>(
        'Create',
        create,
        true,
        false,
        ($core.List<$core.int> value) => $0.NoteWithTodos.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NoteWithTodos, $0.Empty>(
        'Update',
        update,
        true,
        false,
        ($core.List<$core.int> value) => $0.NoteWithTodos.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Note, $0.Empty>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Note.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoAllRequest, $0.TodoList>(
        'AllTodos',
        allTodos_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.TodoAllRequest.fromBuffer(value),
        ($0.TodoList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoList, $0.Empty>(
        'CreateTodo',
        createTodo,
        true,
        false,
        ($core.List<$core.int> value) => $0.TodoList.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoList, $0.Empty>(
        'UpdateTodo',
        updateTodo,
        true,
        false,
        ($core.List<$core.int> value) => $0.TodoList.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Todo, $0.Empty>(
        'UpdateSingleTodo',
        updateSingleTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Todo.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Todo, $0.Empty>(
        'DeleteTodo',
        deleteTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Todo.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TodoList, $0.Empty>(
        'DeleteAllTodos',
        deleteAllTodos,
        true,
        false,
        ($core.List<$core.int> value) => $0.TodoList.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Stream<$0.NoteAllResponse> all_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* all(call, await request);
  }

  $async.Future<$0.Empty> delete_Pre($grpc.ServiceCall call, $async.Future<$0.Note> request) async {
    return delete(call, await request);
  }

  $async.Stream<$0.TodoList> allTodos_Pre($grpc.ServiceCall call, $async.Future<$0.TodoAllRequest> request) async* {
    yield* allTodos(call, await request);
  }

  $async.Future<$0.Empty> updateSingleTodo_Pre($grpc.ServiceCall call, $async.Future<$0.Todo> request) async {
    return updateSingleTodo(call, await request);
  }

  $async.Future<$0.Empty> deleteTodo_Pre($grpc.ServiceCall call, $async.Future<$0.Todo> request) async {
    return deleteTodo(call, await request);
  }

  $async.Stream<$0.NoteAllResponse> all($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> create($grpc.ServiceCall call, $async.Stream<$0.NoteWithTodos> request);
  $async.Future<$0.Empty> update($grpc.ServiceCall call, $async.Stream<$0.NoteWithTodos> request);
  $async.Future<$0.Empty> delete($grpc.ServiceCall call, $0.Note request);
  $async.Stream<$0.TodoList> allTodos($grpc.ServiceCall call, $0.TodoAllRequest request);
  $async.Future<$0.Empty> createTodo($grpc.ServiceCall call, $async.Stream<$0.TodoList> request);
  $async.Future<$0.Empty> updateTodo($grpc.ServiceCall call, $async.Stream<$0.TodoList> request);
  $async.Future<$0.Empty> updateSingleTodo($grpc.ServiceCall call, $0.Todo request);
  $async.Future<$0.Empty> deleteTodo($grpc.ServiceCall call, $0.Todo request);
  $async.Future<$0.Empty> deleteAllTodos($grpc.ServiceCall call, $async.Stream<$0.TodoList> request);
}
