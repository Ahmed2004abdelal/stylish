// ============================================================
// scripts/seed_firestore.dart
// 🔥 FIRESTORE SEEDER - E-COMMERCE APP
// ============================================================
// ملاحظة: السكريبت ده بيشتغل بشكل مستقل. شغله من سطر الأوامر:
// dart run scripts/seed_firestore.dart
// ============================================================

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// 1. نقطة البداية
void main() async {
  // 2. تأكد من تهيئة Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // لو عندك أكتر من مشروع، حدد الخيارات هنا.
    // options: DefaultFirebaseOptions.currentPlatform,
  );

  // 3. ابدأ الاتصال
  final firestore = FirebaseFirestore.instance;

  print('🌱 بدء عملية رفع البيانات التجريبية...\n');

  // 4. استدعاء دوال الرفع
  await seedUsers(firestore);
  await seedCategories(firestore);
  await seedProducts(firestore);
  await seedOrders(firestore);

  print('\n🎉 تم رفع كل البيانات بنجاح!');
}

// ============================================================
// (هنا بتحط دوال seedUsers, seedCategories, seedProducts, seedOrders)
// ... هما بالضبط زى ما انت كاتبهم، مافيش تغيير فيهم ...
// ============================================================

// ============================================================
// USERS
// ============================================================

Future<void> seedUsers(FirebaseFirestore firestore) async {
  final users = [
    {
      'uid': 'user_001',
      'email': 'john.doe@example.com',
      'name': 'John Doe',
      'phone': '+1 555 123 4567',
      'profileImage': 'https://randomuser.me/api/portraits/men/1.jpg',
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
    {
      'uid': 'user_002',
      'email': 'jane.smith@example.com',
      'name': 'Jane Smith',
      'phone': '+1 555 987 6543',
      'profileImage': 'https://randomuser.me/api/portraits/women/1.jpg',
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
  ];

  for (final user in users) {
    await firestore.collection('users').doc(user['uid'] as String).set(user);
  }

  print('✅ Users seeded (${users.length})');
}

// ============================================================
// CATEGORIES
// ============================================================

Future<void> seedCategories(FirebaseFirestore firestore) async {
  final categories = [
    {
      'id': 'cat_men',
      'name': 'Men',
      'image': 'https://images.unsplash.com/photo-1521334884684-d80222895322',
      'icon': 'male',
      'subcategories': ['T-Shirts', 'Shirts', 'Jeans', 'Shoes'],
      'productCount': 0,
      'isActive': true,
      'createdAt': FieldValue.serverTimestamp(),
    },
    {
      'id': 'cat_women',
      'name': 'Women',
      'image': 'https://images.unsplash.com/photo-1483985988355-763728e1935b',
      'icon': 'female',
      'subcategories': ['Dresses', 'Tops', 'Bags', 'Shoes'],
      'productCount': 0,
      'isActive': true,
      'createdAt': FieldValue.serverTimestamp(),
    },
    {
      'id': 'cat_electronics',
      'name': 'Electronics',
      'image': 'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5',
      'icon': 'devices',
      'subcategories': ['Phones', 'Laptops', 'Audio', 'Watches'],
      'productCount': 0,
      'isActive': true,
      'createdAt': FieldValue.serverTimestamp(),
    },
  ];

  for (final c in categories) {
    await firestore.collection('categories').doc(c['id'] as String).set(c);
  }

  print('✅ Categories seeded (${categories.length})');
}

// ============================================================
// PRODUCTS (IMPROVED FASHION + REALISTIC IMAGES)
// ============================================================

Future<void> seedProducts(FirebaseFirestore firestore) async {
  final products = [
    {
      'id': 'prod_001',
      'name': 'Nike Premium Hoodie',
      'brand': 'Nike',
      'categoryId': 'cat_men',
      'subcategory': 'T-Shirts',
      'price': 59.99,
      'salePrice': 49.99,
      'discountPercentage': 17,
      'description': 'Premium cotton hoodie with modern fit design.',
      'sizes': ['S', 'M', 'L', 'XL'],
      'colors': ['Black', 'Gray'],
      'images': [
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7',
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
      ],
      'thumbnail': 'https://images.unsplash.com/photo-1556821840-3a63f95609a7',
      'rating': 4.6,
      'reviewCount': 120,
      'inStock': true,
      'quantity': 50,
      'isFeatured': true,
      'isNew': true,
      'tags': ['hoodie', 'men', 'nike'],
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
    {
      'id': 'prod_002',
      'name': 'Elegant Women Dress',
      'brand': 'Zara',
      'categoryId': 'cat_women',
      'subcategory': 'Dresses',
      'price': 79.99,
      'salePrice': 59.99,
      'discountPercentage': 25,
      'description': 'Elegant summer dress with soft fabric.',
      'sizes': ['S', 'M', 'L'],
      'colors': ['Pink', 'White'],
      'images': [
        'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446',
        'https://images.unsplash.com/photo-1539008835657-9e8e9680c956',
      ],
      'thumbnail': 'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446',
      'rating': 4.7,
      'reviewCount': 210,
      'inStock': true,
      'quantity': 40,
      'isFeatured': true,
      'isNew': false,
      'tags': ['dress', 'women', 'fashion'],
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
    {
      'id': 'prod_003',
      'name': 'Apple AirPods Pro',
      'brand': 'Apple',
      'categoryId': 'cat_electronics',
      'subcategory': 'Audio',
      'price': 249.99,
      'salePrice': 219.99,
      'discountPercentage': 12,
      'description': 'Noise cancelling wireless earbuds.',
      'sizes': ['One Size'],
      'colors': ['White'],
      'images': [
        'https://images.unsplash.com/photo-1580894908361-967195033215',
      ],
      'thumbnail': 'https://images.unsplash.com/photo-1580894908361-967195033215',
      'rating': 4.9,
      'reviewCount': 5000,
      'inStock': true,
      'quantity': 100,
      'isFeatured': true,
      'isNew': true,
      'tags': ['apple', 'airpods', 'audio'],
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
  ];

  for (final p in products) {
    await firestore.collection('products').doc(p['id'] as String).set(p);
  }

  print('✅ Products seeded (${products.length})');
}

// ============================================================
// ORDERS (FIXED + COMPLETE SCHEMA)
// ============================================================

Future<void> seedOrders(FirebaseFirestore firestore) async {
  final orders = [
    {
      'id': 'ord_001',
      'userId': 'user_001',
      'orderNumber': 'ORD-1001',
      'items': [
        {
          'productId': 'prod_001',
          'productName': 'Nike Premium Hoodie',
          'price': 49.99,
          'quantity': 2,
        }
      ],
      'subtotal': 99.98,
      'shippingCost': 5.0,
      'tax': 8.0,
      'total': 112.98,
      'status': 'delivered',
      'paymentStatus': 'paid',
      'paymentMethod': 'card',
      'shippingAddress': {
        'city': 'Cairo',
        'country': 'Egypt',
      },
      'trackingNumber': 'TRK123',
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
    {
      'id': 'ord_002',
      'userId': 'user_002',
      'orderNumber': 'ORD-1002',
      'items': [
        {
          'productId': 'prod_002',
          'productName': 'Elegant Women Dress',
          'price': 59.99,
          'quantity': 1,
        }
      ],
      'subtotal': 59.99,
      'shippingCost': 5.0,
      'tax': 4.0,
      'total': 68.99,
      'status': 'processing',
      'paymentStatus': 'paid',
      'paymentMethod': 'paypal',
      'shippingAddress': {
        'city': 'Alexandria',
        'country': 'Egypt',
      },
      'trackingNumber': null,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
    {
      'id': 'ord_003',
      'userId': 'user_001',
      'orderNumber': 'ORD-1003',
      'items': [
        {
          'productId': 'prod_003',
          'productName': 'Apple AirPods Pro',
          'price': 219.99,
          'quantity': 1,
        }
      ],
      'subtotal': 219.99,
      'shippingCost': 0,
      'tax': 18.0,
      'total': 237.99,
      'status': 'shipped',
      'paymentStatus': 'paid',
      'paymentMethod': 'visa',
      'shippingAddress': {
        'city': 'Giza',
        'country': 'Egypt',
      },
      'trackingNumber': 'TRK999',
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    },
  ];

  for (final o in orders) {
    await firestore.collection('orders').doc(o['id'] as String).set(o);
  }

  print('✅ Orders seeded (${orders.length})');
}