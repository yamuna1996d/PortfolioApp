import '../models/portfolio_data.dart';


abstract class PortfolioRepository {
  Future<PortfolioData> fetchPortfolio();
}