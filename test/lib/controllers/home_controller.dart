import 'dart:async'; 
import 'package:flutter/material.dart';
import '../models/request.dart';
import '../services/api_service.dart';

class HomeController {
  final ApiService _apiService = ApiService();

  ValueNotifier<String> nextRiderTime = ValueNotifier<String>('Loading...');
  ValueNotifier<bool> showFullText = ValueNotifier<bool>(false);
  ValueNotifier<bool> showSuccessBanner = ValueNotifier<bool>(false);
  ValueNotifier<bool> showNavBar = ValueNotifier<bool>(false);
  ValueNotifier<List<Request>> pastRequests = ValueNotifier<List<Request>>([]);
  Timer? _bannerTimer; 

 
  void init() {
    fetchNextRider();
    fetchRequestHistory();
  }

  Future<void> fetchNextRider() async {
    final rider = await _apiService.fetchNextRider();
    nextRiderTime.value = rider.estimatedArrivalTime;
  }

  Future<void> fetchRequestHistory() async {
    final requests = await _apiService.fetchRequestHistory();
    pastRequests.value = requests;
  }

  Future<bool> sendRequest(String phone) async {
    final success = await _apiService.sendRequest(phone);
    if (success) {
      await fetchRequestHistory();
      _showSuccessBannerTemporarily(); 
    }
    return success;
  }

void toggleNavBar() {
  showNavBar.value = !showNavBar.value; 
}

void _showSuccessBannerTemporarily() {
  showSuccessBanner.value = true; 
  _bannerTimer?.cancel(); 
  _bannerTimer = Timer(const Duration(seconds: 3), () {
    showSuccessBanner.value = false; 
  });
}

  void setShowFullText(bool value) {
    showFullText.value = value;
  }

 
  void dispose() {
    _bannerTimer?.cancel();
    nextRiderTime.dispose();
    showFullText.dispose();
    showSuccessBanner.dispose();
    showNavBar.dispose();
    pastRequests.dispose();
  }
}