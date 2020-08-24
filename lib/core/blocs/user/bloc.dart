library core.blocs.user;

import 'dart:async';
import 'dart:convert';

import 'package:nedproject/core/blocs/auth/bloc.dart';
import 'package:nedproject/core/repositories/user/user_repository.dart';
import 'package:nedproject/data/api/model/login_user.dart';
import 'package:nedproject/data/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:meta/meta.dart';

part 'user_bloc.dart';
part 'user_events.dart';
part 'user_state.dart';