import 'package:budget_app/helpers/color_helper.dart';
import 'package:budget_app/models/category_model.dart';
import 'package:budget_app/models/expense_model.dart';
import 'package:budget_app/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / category.maxAmount;

    _buildExpenses() {
      List<Widget> expenseList = [];
      category.expenses.forEach(
        (Expense expense) {
          expenseList.add(
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              height: 80.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      expense.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '-\$${expense.cost.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
      return Column(
        children: expenseList,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  backgroundColor: Colors.grey[200],
                  lineColor: getColor(context, percent),
                  percent: percent,
                  width: 15.0,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)} / \$${category.maxAmount}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}
