import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expenses,
    required this.onRemoveExpense,
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ),
        background: Container(
          color: const Color.fromARGB(255, 199, 30, 30).withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal / 2,
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.delete_rounded,
                  color: Color.fromARGB(255, 252, 252, 255),
                ),
                Text(
                  'Delete',
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 252, 255),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[index],
          );
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
