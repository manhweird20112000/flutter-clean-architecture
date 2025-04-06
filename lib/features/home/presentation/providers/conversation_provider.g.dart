// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getConversationsUseCaseHash() =>
    r'05beb046f6a2ba70938fb951fe291efd53d56488';

/// See also [getConversationsUseCase].
@ProviderFor(getConversationsUseCase)
final getConversationsUseCaseProvider =
    AutoDisposeProvider<GetConversationsUseCase>.internal(
  getConversationsUseCase,
  name: r'getConversationsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getConversationsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetConversationsUseCaseRef
    = AutoDisposeProviderRef<GetConversationsUseCase>;
String _$homeHash() => r'f81c596d2e4876596e213720117b8c1d88478454';

/// See also [Home].
@ProviderFor(Home)
final homeProvider =
    AutoDisposeNotifierProvider<Home, ConversationState>.internal(
  Home.new,
  name: r'homeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Home = AutoDisposeNotifier<ConversationState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
