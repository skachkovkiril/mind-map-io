"""Added required tables

Revision ID: 2f661334a302
Revises: 
Create Date: 2022-10-22 14:15:05.037513

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '2f661334a302'
down_revision = None
branch_labels = None
depends_on = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('node',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=100), nullable=True),
    sa.Column('description', sa.Text(), nullable=True),
    sa.Column('size', sa.Integer(), nullable=True),
    sa.Column('color', sa.String(length=45), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('edge',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('type_edge', sa.Enum('arrow', 'line', name='type_edge'), nullable=True),
    sa.Column('size', sa.Integer(), nullable=True),
    sa.Column('id_node_from', sa.Integer(), nullable=False),
    sa.Column('id_node_to', sa.Integer(), nullable=False),
    sa.ForeignKeyConstraint(['id_node_from'], ['node.id'], ),
    sa.ForeignKeyConstraint(['id_node_to'], ['node.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_edge_id_node_from'), 'edge', ['id_node_from'], unique=False)
    op.create_index(op.f('ix_edge_id_node_to'), 'edge', ['id_node_to'], unique=False)
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_edge_id_node_to'), table_name='edge')
    op.drop_index(op.f('ix_edge_id_node_from'), table_name='edge')
    op.drop_table('edge')
    op.drop_table('node')
    # ### end Alembic commands ###
