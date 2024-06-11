import 'package:_05_expense_tracker/models/expense.dart';
import 'package:_05_expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  final List<Expense> expenses;
  final void Function(Expense expense) onExpenseRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            onDismissed: (direction) {
              onExpenseRemoved(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.5),
                margin: EdgeInsets.symmetric(
                    horizontal:
                        Theme.of(context).cardTheme.margin!.horizontal)),
            child: ExpenseItem(expense: expenses[index])));
  }
}
