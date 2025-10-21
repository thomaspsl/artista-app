import 'package:artista/config/controller.dart';
import 'package:artista/views/add_post.dart';
import 'package:artista/views/app.dart';
import 'package:artista/views/collections.dart';
import 'package:artista/views/conversations.dart';
import 'package:artista/views/details_collection.dart';
import 'package:artista/views/details_post.dart';
import 'package:artista/views/home.dart';
import 'package:artista/views/login.dart';
import 'package:artista/views/messages.dart';
import 'package:artista/views/modify_profile.dart';
import 'package:artista/views/notifications.dart';
import 'package:artista/views/on_boarding.dart';
import 'package:artista/views/profile.dart';
import 'package:artista/views/register.dart';
import 'package:artista/views/search.dart';
import 'package:artista/views/settings.dart';
import 'package:artista/views/conditions.dart';
import 'package:artista/views/problem.dart';
import 'package:artista/views/languages.dart';
import 'package:artista/views/privacy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Routes extends StatelessWidget {
  static late Widget currentRouteWidget;

  // Global routes for the application
  static final GoRouter router = GoRouter(
    initialLocation: '/on-boarding',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return App(child: child);
        },
        routes: [
          // Logged Routes
          GoRoute(
            path: '/on-boarding',
            name: 'on-boarding',
            pageBuilder: (context, state) {
              currentRouteWidget = OnBoarding();
              return NoTransitionPage(
                child: currentRouteWidget,
              );
            },
            routes: [
              GoRoute(
                path: 'login',
                name: 'login',
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      Controller.bookTransition(
                          context, animation, secondaryAnimation, child, currentRouteWidget, 1),
                  child: Login(),
                ),
              ),
              GoRoute(
                path: 'register',
                name: 'register',
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      Controller.bookTransition(
                          context, animation, secondaryAnimation, child, currentRouteWidget, 1),
                  child: Register(),
                ),
              ),
            ],
          ),

          // Header Routes
          GoRoute(
            path: '/search',
            name: 'search',
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  Controller.bookTransition(
                      context, animation, secondaryAnimation, child, currentRouteWidget, -1),
              child: Search(),
            ),
          ),
          GoRoute(
            path: '/me',
            name: 'me',
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  Controller.bookTransition(
                      context, animation, secondaryAnimation, child, currentRouteWidget, 1),
              child: Profile(),
            ),
            routes: [
              GoRoute(
                path: 'edit',
                name: 'edit',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: ModifyProfile(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                  Controller.slideTransition(context, animation, secondaryAnimation, child, 1, 0),
              child: Settings(),
            ),
            routes: [
              GoRoute(
                path: 'conditions',
                name: 'conditions',
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      Controller.slideTransition(
                          context, animation, secondaryAnimation, child, 1, 0),
                  child: Conditions(),
                ),
              ),
              GoRoute(
                path: 'problem',
                name: 'problem',
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      Controller.slideTransition(
                          context, animation, secondaryAnimation, child, 1, 0),
                  child: Problem(),
                ),
              ),
              GoRoute(
                path: 'languages',
                name: 'languages',
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      Controller.slideTransition(
                          context, animation, secondaryAnimation, child, 1, 0),
                  child: Languages(),
                ),
              ),
              GoRoute(
                path: 'privacy',
                name: 'privacy',
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                      Controller.slideTransition(
                          context, animation, secondaryAnimation, child, 1, 0),
                  child: Privacy(),
                ),
              ),
            ],
          ),

          // Inside Routes
          GoRoute(
            path: '/profile/:uuid',
            name: 'profile',
            pageBuilder: (context, state) => NoTransitionPage(
              child: Profile(uuid: state.params['uuid']!),
            ),
          ),
          GoRoute(
            path: '/post/:uuid',
            name: 'post',
            pageBuilder: (context, state) => NoTransitionPage(
              child: DetailsPost(uuid: state.params['uuid']!),
            ),
          ),
          GoRoute(
            path: '/collection/:uuid',
            name: 'collection',
            pageBuilder: (context, state) => NoTransitionPage(
              child: DetailsCollection(uuid: state.params['uuid']!),
            ),
          ),
          GoRoute(
            path: '/conversation/:from/:to',
            name: 'messages',
            pageBuilder: (context, state) => NoTransitionPage(
              child: Messages(from: state.params['from']!, to: state.params['to']!),
            ),
          ),

          // Bottom Routes
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) {
              currentRouteWidget = Home();
              return NoTransitionPage(
                child: currentRouteWidget,
              );
            },
          ),
          GoRoute(
            path: '/notifications',
            name: 'notifications',
            pageBuilder: (context, state) {
              currentRouteWidget = Notifications();
              return NoTransitionPage(
                child: currentRouteWidget,
              );
            },
          ),
          GoRoute(
            path: '/add-post',
            name: 'add-post',
            pageBuilder: (context, state) {
              currentRouteWidget = AddPost();
              return NoTransitionPage(
                child: currentRouteWidget,
              );
            },
          ),
          GoRoute(
            path: '/collections',
            name: 'collections',
            pageBuilder: (context, state) {
              currentRouteWidget = Collections();
              return NoTransitionPage(
                child: currentRouteWidget,
              );
            },
          ),
          GoRoute(
            path: '/conversations',
            name: 'conversations',
            pageBuilder: (context, state) {
              currentRouteWidget = Conversations();
              return NoTransitionPage(
                child: currentRouteWidget,
              );
            },
          ),
        ],
      ),
    ],
  );
}
